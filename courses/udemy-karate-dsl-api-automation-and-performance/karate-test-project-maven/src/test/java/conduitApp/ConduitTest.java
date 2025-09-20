package conduitApp;

import java.io.File;
import java.util.Arrays;
import com.intuit.karate.junit5.Karate;

class ConduitTest {

    // this will run all *.feature files that exist in subdirectories
    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }

    // For use with JUnit @Test annotation, will need to be reworks for @Karate.Test
    private int getKeepCount() {
        String keepCountEnv = System.getenv("KARATE_KEEP_REPORTS");
        System.out.println("KARATE_KEEP_REPORTS environment variable: " + keepCountEnv);
        /**
         * In your pom.xml:
         * <plugin>
         * <groupId>org.apache.maven.plugins</groupId>
         * <artifactId>maven-surefire-plugin</artifactId>
         * <version>3.0.0-M7</version>
         * <configuration>
         * <environmentVariables>
         * <KARATE_KEEP_REPORTS>5</KARATE_KEEP_REPORTS>
         * </environmentVariables>
         * </configuration>
         * </plugin>
         */
        if (keepCountEnv == null || keepCountEnv.trim().isEmpty()) {
            System.out.println("Using default keep count: 3");
            return 3;
        }

        try {
            int count = Integer.parseInt(keepCountEnv.trim());
            int result = count > 0 ? count : 3;
            System.out.println("Using keep count: " + result);
            return result;
        } catch (NumberFormatException e) {
            System.out.println("Invalid KARATE_KEEP_REPORTS value: " + keepCountEnv + ". Using default: 3");
            return 3;
        }
    }

    private void keepLastNReports(int keepCount) {
        File targetDir = new File("target");
        if (!targetDir.exists())
            return;

        // Find all karate-reports_* folders
        File[] reportFolders = targetDir
                .listFiles((dir, name) -> name.startsWith("karate-reports_") && new File(dir, name).isDirectory());

        if (reportFolders == null || reportFolders.length <= keepCount) {
            System.out.println("Found " + (reportFolders != null ? reportFolders.length : 0) +
                    " report folders, keeping all (limit: " + keepCount + ")");
            return;
        }

        System.out.println("Found " + reportFolders.length + " report folders, keeping last " +
                keepCount + ", deleting " + (reportFolders.length - keepCount));

        // Sort by timestamp in folder name (newest first)
        // Extract timestamp from "karate-reports_1758217706361" and sort numerically
        Arrays.sort(reportFolders, (a, b) -> {
            long timestampA = extractTimestamp(a.getName());
            long timestampB = extractTimestamp(b.getName());
            return Long.compare(timestampB, timestampA); // newest first
        });

        // Delete folders beyond the keep count
        for (int i = keepCount; i < reportFolders.length; i++) {
            System.out.println("Deleting old report folder: " + reportFolders[i].getName());
            deleteDirectory(reportFolders[i]);
        }
    }

    private long extractTimestamp(String folderName) {
        try {
            // Extract timestamp from "karate-reports_1758217706361"
            String timestamp = folderName.substring("karate-reports_".length());
            return Long.parseLong(timestamp);
        } catch (Exception e) {
            // If we can't parse timestamp, use 0 (will be sorted as oldest)
            return 0;
        }
    }

    private void deleteDirectory(File dir) {
        File[] files = dir.listFiles();
        if (files != null) {
            for (File file : files) {
                if (file.isDirectory()) {
                    deleteDirectory(file);
                } else {
                    file.delete();
                }
            }
        }
        dir.delete();
    }
}

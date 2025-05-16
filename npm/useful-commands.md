# make install logs more readable
``npm install --loglevel=warn --color=always 2>&1 | less -R``

* ``--loglevel=warn`` This tells NPM to only show warnings and errors, skipping all the usual info-level noise like:
* ``--color=always`` Forces NPM to use colored output (even when piping). This is important because by default, NPM disables color if it thinks the output is being redirected to something that doesn’t support it.
* ``2>&1`` This merges stderr (2) into stdout (1). 
  * Why? Because:
    * NPM prints errors to stderr 
    * If you want to pipe all output (both normal + error) into something (like less), you need to combine them.
**Possibly better without the below**
* ``| less -R`` This takes the combined output and pipes it into less, a pager that lets you scroll up and down easily. The -R flag tells less to interpret raw ANSI color codes, so the color from --color=always is preserved.
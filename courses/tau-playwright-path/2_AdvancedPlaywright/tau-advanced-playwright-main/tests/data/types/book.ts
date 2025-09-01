export interface Book {
  isbn: string;
  title: string;
  subTitle: string;
  author: string;
  publish_date: string; // ISO 8601 date string
  publisher: string;
  pages: number;
  description: string;
  website: string;
}
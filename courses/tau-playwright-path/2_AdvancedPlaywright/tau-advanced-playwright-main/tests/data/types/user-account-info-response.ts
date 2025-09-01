import { Book } from "./book";


export interface UserAccountInfoResponse {
  userId: string;
  username: string;
  books: Book[];
}
/*
  Warnings:

  - Added the required column `mode` to the `Timeblock` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Timeblock" ADD COLUMN     "mode" TEXT NOT NULL,
ALTER COLUMN "project" DROP NOT NULL;

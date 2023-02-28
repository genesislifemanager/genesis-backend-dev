/*
  Warnings:

  - The `timeblocks` column on the `Project` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `project` column on the `Timeblock` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `projects` column on the `Venture` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "Project" DROP COLUMN "timeblocks",
ADD COLUMN     "timeblocks" INTEGER[];

-- AlterTable
ALTER TABLE "Timeblock" DROP COLUMN "project",
ADD COLUMN     "project" INTEGER;

-- AlterTable
ALTER TABLE "Venture" DROP COLUMN "projects",
ADD COLUMN     "projects" INTEGER[];

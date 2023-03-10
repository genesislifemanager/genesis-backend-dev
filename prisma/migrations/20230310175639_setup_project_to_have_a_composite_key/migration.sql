/*
  Warnings:

  - The primary key for the `Project` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Made the column `uid` on table `Project` required. This step will fail if there are existing NULL values in that column.
  - Made the column `uid` on table `Timeblock` required. This step will fail if there are existing NULL values in that column.
  - Made the column `uid` on table `Venture` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "Timeblock" DROP CONSTRAINT "Timeblock_projectId_fkey";

-- AlterTable
ALTER TABLE "Project" DROP CONSTRAINT "Project_pkey",
ALTER COLUMN "uid" SET NOT NULL,
ADD CONSTRAINT "Project_pkey" PRIMARY KEY ("id", "uid");

-- AlterTable
ALTER TABLE "Timeblock" ALTER COLUMN "uid" SET NOT NULL;

-- AlterTable
ALTER TABLE "Venture" ALTER COLUMN "uid" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "Timeblock" ADD CONSTRAINT "Timeblock_projectId_uid_fkey" FOREIGN KEY ("projectId", "uid") REFERENCES "Project"("id", "uid") ON DELETE RESTRICT ON UPDATE CASCADE;

/*
  Warnings:

  - You are about to drop the column `timeblocks` on the `Project` table. All the data in the column will be lost.
  - You are about to drop the column `project` on the `Timeblock` table. All the data in the column will be lost.
  - Added the required column `projectId` to the `Timeblock` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Project" DROP COLUMN "timeblocks";

-- AlterTable
ALTER TABLE "Timeblock" DROP COLUMN "project",
ADD COLUMN     "projectId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Timeblock" ADD CONSTRAINT "Timeblock_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

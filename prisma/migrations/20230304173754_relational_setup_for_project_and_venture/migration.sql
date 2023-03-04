/*
  Warnings:

  - You are about to drop the column `projects` on the `Venture` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Timeblock" DROP CONSTRAINT "Timeblock_projectId_fkey";

-- AlterTable
ALTER TABLE "Project" ADD COLUMN     "ventureId" INTEGER;

-- AlterTable
ALTER TABLE "Timeblock" ALTER COLUMN "projectId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Venture" DROP COLUMN "projects";

-- AddForeignKey
ALTER TABLE "Timeblock" ADD CONSTRAINT "Timeblock_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Project"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Project" ADD CONSTRAINT "Project_ventureId_fkey" FOREIGN KEY ("ventureId") REFERENCES "Venture"("id") ON DELETE SET NULL ON UPDATE CASCADE;

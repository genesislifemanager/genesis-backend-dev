/*
  Warnings:

  - The primary key for the `Venture` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "Project" DROP CONSTRAINT "Project_ventureId_fkey";

-- AlterTable
ALTER TABLE "Venture" DROP CONSTRAINT "Venture_pkey",
ADD CONSTRAINT "Venture_pkey" PRIMARY KEY ("id", "uid");

-- AddForeignKey
ALTER TABLE "Project" ADD CONSTRAINT "Project_ventureId_uid_fkey" FOREIGN KEY ("ventureId", "uid") REFERENCES "Venture"("id", "uid") ON DELETE RESTRICT ON UPDATE CASCADE;

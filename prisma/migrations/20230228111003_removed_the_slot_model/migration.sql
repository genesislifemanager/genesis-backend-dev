/*
  Warnings:

  - You are about to drop the `Slot` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `duration` to the `Timeblock` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Timeblock" ADD COLUMN     "duration" DOUBLE PRECISION NOT NULL,
ADD COLUMN     "e" TIMESTAMP(3),
ADD COLUMN     "s" TIMESTAMP(3);

-- DropTable
DROP TABLE "Slot";

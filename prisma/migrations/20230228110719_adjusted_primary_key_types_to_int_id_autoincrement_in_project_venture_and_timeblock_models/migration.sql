/*
  Warnings:

  - The primary key for the `Project` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Project` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Slot` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Slot` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Timeblock` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Timeblock` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Venture` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `Venture` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "Project" DROP CONSTRAINT "Project_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Project_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Slot" DROP CONSTRAINT "Slot_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Slot_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Timeblock" DROP CONSTRAINT "Timeblock_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Timeblock_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Venture" DROP CONSTRAINT "Venture_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "Venture_pkey" PRIMARY KEY ("id");

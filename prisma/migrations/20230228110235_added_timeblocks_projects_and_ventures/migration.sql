-- CreateTable
CREATE TABLE "Slot" (
    "id" TEXT NOT NULL,
    "s" TIMESTAMP(3),
    "e" TIMESTAMP(3),
    "duration" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "Slot_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Timeblock" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "due" TIMESTAMP(3),
    "slots" TEXT[],
    "reminder" TIMESTAMP(3),
    "status" BOOLEAN NOT NULL,
    "project" TEXT NOT NULL,

    CONSTRAINT "Timeblock_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Project" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "timeblocks" TEXT[],
    "duration" DOUBLE PRECISION NOT NULL,
    "due" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL,

    CONSTRAINT "Project_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Venture" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "projects" TEXT[],

    CONSTRAINT "Venture_pkey" PRIMARY KEY ("id")
);

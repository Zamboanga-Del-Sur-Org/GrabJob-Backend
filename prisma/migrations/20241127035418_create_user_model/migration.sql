-- CreateEnum
CREATE TYPE "UserType" AS ENUM ('JOBSEEKER', 'CLIENT');

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "firstName" VARCHAR(100) NOT NULL,
    "lastName" VARCHAR(100) NOT NULL,
    "province" VARCHAR(150) NOT NULL,
    "barangay" VARCHAR(150) NOT NULL,
    "city" VARCHAR(150) NOT NULL,
    "street" VARCHAR(150),
    "birthDate" TIMESTAMP(3) NOT NULL,
    "attachments" JSONB NOT NULL,
    "type" "UserType" NOT NULL DEFAULT 'JOBSEEKER',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Credentials" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "username" VARCHAR(100) NOT NULL,
    "password" VARCHAR(250) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Credentials_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Credentials_userId_key" ON "Credentials"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Credentials_userId_username_key" ON "Credentials"("userId", "username");

-- AddForeignKey
ALTER TABLE "Credentials" ADD CONSTRAINT "Credentials_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

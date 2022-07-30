-- Exercício de criação de banco de dados ---

CREATE DATABASE "drivenBank";
\c "drivenBank";
CREATE TABLE "states" (
"id" SERIAL PRIMARY KEY,
"name" TEXT NOT NULL
);
CREATE TABLE "cities" (
"id" SERIAL PRIMARY KEY,
"name" TEXT NOT NULL,
"stateId" INTEGER NOT NULL REFERENCES "states"("id") 
);
CREATE TABLE "customers" (
"id" SERIAL PRIMARY KEY,
"fullName" TEXT NOT NULL,
"cpf" VARCHAR(11) UNIQUE NOT NULL,
"email" TEXT UNIQUE NOT NULL,
"password" TEXT NOT NULL
);
CREATE TABLE "customerPhones" (
"id" SERIAL PRIMARY KEY,
"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
"number" VARCHAR(11) NOT NULL,
"type" TEXT NOT NULL
);
CREATE TABLE "customerAddresses" (
"id" SERIAL PRIMARY KEY,
"customerId" INTEGER NOT NULL UNIQUE REFERENCES "customers"("id"),
"street" TEXT NOT NULL,
"number" TEXT NOT NULL,
"complement" TEXT NOT NULL,
"postalCode" VARCHAR(8) NOT NULL,
"cityId" INTEGER NOT NULL REFERENCES "cities"("id")
);
CREATE TABLE "bankAccount" (
"id" SERIAL PRIMARY KEY,
"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
"accountNumber" TEXT NOT NULL,
"agency" TEXT NOT NULL,
"openDate" DATE NOT NULL,
"closeDate" DATE NOT NULL
);
CREATE TABLE "transactions" (
"id" SERIAL PRIMARY KEY,
"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
"amount" INTEGER NOT NULL,
"type" TEXT NOT NULL,
"time" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
"description" TEXT NOT NULL,
"cancelled" BOOLEAN NOT NULL DEFAULT FALSE
);
CREATE TABLE "creditCards" (
"id" SERIAL PRIMARY KEY,
"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
"name" TEXT NOT NULL,
"number BIGINT NOT NULL,
"securityCode" VARCHAR(3) NOT NULL,
"expirationMonth" INTEGER NOT NULL,
"expirationYear" INTEGER NOT NULL,
"password" TEXT NOT NULL,
"limit" INTEGER NOT NULL
);

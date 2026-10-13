


CREATE TABLE "transacao"(
    "id" BIGINT NOT NULL,
    "id_ativo_financeiro" BIGINT NOT NULL,
    "valor" FLOAT(53) NOT NULL,
    "data" DATE NOT NULL,
    "tipo_transacao" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "transacao" ADD PRIMARY KEY("id");
CREATE TABLE "orcamento"(
    "id" BIGINT NOT NULL,
    "id_ativo_financeiro" BIGINT NOT NULL,
    "objetivo" VARCHAR(255) NOT NULL,
    "valor_meta" FLOAT(53) NOT NULL
);
ALTER TABLE
    "orcamento" ADD PRIMARY KEY("id");
CREATE TABLE "investimento"(
    "id" BIGINT NOT NULL,
    "id_ativo_financeiro" BIGINT NOT NULL,
    "tipo_investimento" VARCHAR(255) NOT NULL,
    "valor_inicial_gasto" FLOAT(53) NOT NULL,
    "valor_mensal_investido" FLOAT(53) NOT NULL,
    "saldo" FLOAT(53) NOT NULL,
    "rentabilidade" FLOAT(53) NOT NULL
);
ALTER TABLE
    "investimento" ADD PRIMARY KEY("id");
CREATE TABLE "conta"(
    "id" BIGINT NOT NULL,
    "id_usuario" BIGINT NOT NULL,
    "id_banco" BIGINT NOT NULL,
    "tipo" VARCHAR(255) NOT NULL,
    "numero_conta" VARCHAR(255) NOT NULL,
    "numero_agencia" VARCHAR(255) NOT NULL,
    "codigo_seguranca" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "conta" ADD PRIMARY KEY("id");
CREATE TABLE "emprestimo"(
    "id" BIGINT NOT NULL,
    "id_ativo_financeiro" BIGINT NOT NULL,
    "valor_total" FLOAT(53) NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    "numero_parcelas" BIGINT NOT NULL,
    "taxa_juros" FLOAT(53) NOT NULL
);
ALTER TABLE
    "emprestimo" ADD PRIMARY KEY("id");
CREATE TABLE "usuario"(
    "id" BIGINT NOT NULL,
    "nome" VARCHAR(255) NOT NULL,
    "telefone" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "cpf" VARCHAR(255) NOT NULL,
    "data_nascimento" DATE NOT NULL
);
ALTER TABLE
    "usuario" ADD PRIMARY KEY("id");
CREATE TABLE "banco"(
    "id" BIGINT NOT NULL,
    "nome" VARCHAR(255) NOT NULL,
    "cnpj" VARCHAR(255) NOT NULL,
    "data_fundacao" DATE NOT NULL
);
ALTER TABLE
    "banco" ADD PRIMARY KEY("id");
CREATE TABLE "ativo_financeiro"(
    "id" BIGINT NOT NULL,
    "id_conta" BIGINT NOT NULL,
    "tipo_ativo" VARCHAR(255) NOT NULL,
    "data_criacao" DATE NOT NULL
);
ALTER TABLE
    "ativo_financeiro" ADD PRIMARY KEY("id");
ALTER TABLE
    "emprestimo" ADD CONSTRAINT "emprestimo_id_ativo_financeiro_foreign" FOREIGN KEY("id_ativo_financeiro") REFERENCES "ativo_financeiro"("id");
ALTER TABLE
    "ativo_financeiro" ADD CONSTRAINT "ativo_financeiro_id_conta_foreign" FOREIGN KEY("id_conta") REFERENCES "conta"("id");
ALTER TABLE
    "investimento" ADD CONSTRAINT "investimento_id_ativo_financeiro_foreign" FOREIGN KEY("id_ativo_financeiro") REFERENCES "ativo_financeiro"("id");
ALTER TABLE
    "orcamento" ADD CONSTRAINT "orcamento_id_ativo_financeiro_foreign" FOREIGN KEY("id_ativo_financeiro") REFERENCES "ativo_financeiro"("id");
ALTER TABLE
    "transacao" ADD CONSTRAINT "transacao_id_ativo_financeiro_foreign" FOREIGN KEY("id_ativo_financeiro") REFERENCES "ativo_financeiro"("id");
ALTER TABLE
    "conta" ADD CONSTRAINT "conta_id_banco_foreign" FOREIGN KEY("id_banco") REFERENCES "banco"("id");
ALTER TABLE
    "conta" ADD CONSTRAINT "conta_id_usuario_foreign" FOREIGN KEY("id_usuario") REFERENCES "usuario"("id");
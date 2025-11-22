# clinica_terapeutica
Projeto para automatizar a rotina de uma clinica de uma psicológa


📘 README — Sistema de Automação para Psicólogos (SaaS)
🧠 Sobre o Projeto

<p> Este projeto tem como objetivo desenvolver um SaaS voltado para psicólogos PJ, facilitando o gerenciamento da rotina clínica por meio de automações e integrações com ferramentas já utilizadas no dia a dia, como:

Google Agenda

WhatsApp Business API

Google Forms

A plataforma centraliza atendimentos, organiza pacientes, registra evolução clínica e automatiza lembretes e confirmações de consulta. </p>

🎯 Objetivos Principais

<li>Organizar e acompanhar a agenda de consultas.</li>

<li>Enviar confirmação automática aos pacientes 24h antes do atendimento.</li>

<li>Gerenciar o cadastro e histórico dos pacientes.</li>

<li>Registrar e acompanhar a evolução clínica ao longo do tempo.</li>

<li>Integrar ferramentas externas para tornar a rotina mais eficiente.</li>

🧩 Funcionalidades (MVP)
📅 Agenda Inteligente

Criar, editar e cancelar consultas.

Sincronização bidirecional com Google Calendar.

Status: Agendado, Confirmado, Finalizado, Cancelado.

🤖 Automações com WhatsApp

Envio automático:

Confirmação 24h antes.

Mensagem pós-consulta.

Lembretes semanais.

Respostas automáticas via bot com IA.

Logs de automações.

📝 Cadastro e Gestão de Pacientes

Cadastro automático via Google Forms.

Informações pré-consulta para otimizar a primeira sessão.

Histórico detalhado:

Dados pessoais

Motivo da consulta

Histórico clínico

Observações gerais

📈 Evolução do Paciente

Timeline clínica com registros por sessão.

Campos como:

Humor

Observações da sessão

Plano terapêutico

Evolução da queixa principal

Gráficos analíticos da evolução ao longo do tempo.

📊 Dashboard

Total de consultas por dia/semana/mês.

Taxa de faltas.

Engajamento dos pacientes.

Receita estimada (versão futura).

🏗️ Arquitetura do Sistema
Frontend

React / Next.js

Telas principais:

Agenda

Pacientes

Evolução

Dashboard

Configurações e Automações

Backend

Java 17+

Spring Boot 3

Spring Data JPA

PostgreSQL

APIs RESTful para:

Pacientes

Consultas

Evolução

Integrações com WhatsApp, Google Calendar e Google Forms

Banco de Dados (Estrutura Inicial)

Tabelas principais:

patients

appointments

evolution_notes

automation_logs

Integrações
Google Calendar API

Criar, editar e excluir eventos

Sincronização automática

WhatsApp Business Cloud API

Envio de mensagens automáticas

Webhook de retorno para captar respostas dos pacientes

Google Forms → Webhooks

Ao preencher o formulário, o paciente é criado automaticamente no sistema

Infraestrutura Recomendada (Azure)

Azure App Service (Backend)

Azure PostgreSQL Flexible Server

Azure Functions (para webhooks do Forms e WhatsApp)

Azure Key Vault (segredos, tokens, chaves)

Azure Storage (logs, anexos futuros)

🔄 Fluxos Principais
Fluxo 1 — Cadastro automático (Google Forms → API)

Paciente preenche formulário inicial.

Google Forms envia dados para o webhook configurado no backend.

Backend cria ou atualiza o paciente automaticamente.

Paciente recebe mensagem no WhatsApp:
"Seu pré-cadastro foi recebido. Em breve entraremos em contato."

Fluxo 2 — Agendamento

Psicóloga agenda pelo sistema.

Evento é criado automaticamente no Google Calendar.

WhatsApp envia confirmação para o paciente.

Fluxo 3 — Confirmação automática (24h antes)

Rotina verifica consultas marcadas para o dia seguinte.

Envia mensagem automática:
"Confirmar presença? Responda SIM ou NÃO."

Sistema atualiza status conforme a resposta.

Fluxo 4 — Pós-consulta

Ao finalizar uma sessão, o sistema dispara mensagem:
"Sua consulta foi finalizada. Deseja remarcar?"

Bot interpreta respostas e sugere horários livres.

Fluxo 5 — Evolução do Paciente

Psicóloga registra evolução após cada sessão.

Sistema gera linha do tempo clínica.

Dashboard exibe evolução geral e por paciente.

🛠️ Tecnologias
Backend

Java 17+

Spring Boot 3

Spring Web

Spring Data JPA

PostgreSQL

Flyway (migrations)

Lombok

Frontend

React ou Next.js

TailwindCSS

Axios

Integrações

WhatsApp Business Cloud API

Google Calendar API

Google Forms Webhooks (via Google Apps Script ou Extensions)

🚀 Como Executar o Projeto Localmente
🔧 Pré-requisitos

Java 17+

PostgreSQL instalado

Node.js 18+

Conta Meta Developer (WhatsApp)

Conta Google Cloud com:

Calendar API habilitada

Service Account criada

Credentials JSON baixado

________________________________________________
----------------------
#Backend

cd backend
./mvnw spring-boot:run
-----------------------
________________________________________________
-----------------------
#Frontend

cd frontend
npm install
npm run dev
-----------------------

🗺️ Roadmap
✔ MVP

Cadastro automático de pacientes

CRUD de consultas

Integração com Google Calendar

Confirmação automática via WhatsApp

Registro de evolução

Dashboard simples

🔜 Versão 2.0

Configurações avançadas de automações

Módulo financeiro (PIX/boletos)

Relatórios PDF

Aplicativo mobile (Flutter/React Native)

Multi-terapeuta (SaaS completo)

👤 Autor

Guilherme dos Santos Machado
Desenvolvedor & Engenheiro DevOps

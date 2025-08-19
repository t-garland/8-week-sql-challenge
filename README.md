# 8 Week SQL Challenge – Docker Starter

This repository contains a ready-to-use Docker environment and structure for working through the [8 Week SQL Challenge](https://8weeksqlchallenge.com/).

All case studies, datasets, and original questions were created by **Danny Ma (@datawithdanny)**.  
Please visit the official **[8 Week SQL Challenge website](https://8weeksqlchallenge.com/)** for the original materials.

## Getting Started

**Clone the repository**

    git clone https://github.com/t-garland/8-week-sql-challenge.git
    cd 8-week-sql-challenge

**Start the database**

    docker compose up -d

This starts PostgreSQL 16, seeds data from `initdb/` (first boot only), and exposes it on `localhost:5432`.

## Connect from your SQL IDE (I use JetBrains DataGrip)

- **Host:** `localhost`  
- **Port:** `5432`  
- **Database:** `sql8week`  
- **User:** `postgres`  
- **Password:** `postgres`  

If you change these, update both `docker-compose.yml` and your IDE connection settings.

## Repository Structure

    8-week-sql-challenge/
    ├─ docker-compose.yml            # Postgres + init scripts wiring
    ├─ initdb/                       # Auto-runs once on first boot
    │  ├─ 01_schema.sql
    │  ├─ 02_seed_data.sql
    │  └─ ...
    ├─ challenges/                   # Your weekly solutions
    │  ├─ week01/
    │  │  ├─ README.md               # Preamble, questions, links
    │  │  └─ solutions.sql           # Your answers (runnable)
    │  ├─ week02/
    │  │  ├─ README.md
    │  │  └─ solutions.sql
    │  └─ ...
    └─ CREDITS.md                    # Attribution to Danny Ma

## Usage

- Put any `.sql` files you want auto-executed on first boot into `./initdb/` (included).  
- Prefix files with numbers to control order (e.g., `01_`, `02_`, …).  
- Add your working queries in `challenges/weekXX/solutions.sql` (not included).  
- Keep each week’s instructions in `weeks/weekXX/README.md` with a clear credit line (included).

**Re-run from a clean slate (DESTROYS DATA):**

    docker compose down -v
    docker compose up -d

If you’re using a bind mount for data instead of a named volume, delete the folder contents manually before restarting.

## Tips

- Make init scripts **idempotent** where possible (`CREATE TABLE IF NOT EXISTS`, `DO $$ ... EXCEPTION WHEN duplicate_object THEN ... $$;`).  
- If your container started before you added files to `./initdb/`, wipe the volume and start again to trigger init. 
- If `docker compose ps` shows a different host port (e.g., `5433->5432/tcp`), connect using that host port in your IDE.

## Credits

This project is a **personal learning starter** for the community.

All case studies, datasets, and original challenge questions were created by **Danny Ma (@datawithdanny)**.  
Please support and refer to the official site for the full challenges and materials: **https://8weeksqlchallenge.com/**

## Fork/Template Usage

- Fork this repo and keep your solutions in `weeks/`.  
- For a clean public template (no notes), you can keep a separate branch with:
  - Only `docker-compose.yml`, `initdb/`, a minimal `README.md`, and `CREDITS.md`.  
  - Exclude your `weeks/` folder until you’re ready to share solutions.


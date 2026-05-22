#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export PYTHONPATH="$ROOT_DIR"

cleanup() {
  trap - EXIT INT TERM
  kill 0
}

trap cleanup EXIT INT TERM

python3 -m PC0.historic_db.servicio_bd_historica &
python3 -m PC1.broker.broker_mq &
python3 -m PC2.replica_db.servicio_bd_replica &
python3 -m PC2.backend_respaldo.servicio_backend_respaldo &
python3 -m PC3.main_db.servicio_bd_principal &

sleep 1

python3 -m PC2.analytics.servicio_analitica &
python3 -m PC3.backend.servicio_backend_principal &
python3 -m PC1.sensors.simulador_sensores &
python3 -m PC0.simulation.servicio_simulacion &

wait

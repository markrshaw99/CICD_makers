source .venv/bin/activate 
cd ~/message-server

export APP_ENV=PRODUCTION
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=LetMeIn123.
export POSTGRES_HOST=markrs-message-server-db.cvruukypsgyb.eu-west-2.rds.amazonaws.com
export POSTGRES_DB=postgres

pytest -q
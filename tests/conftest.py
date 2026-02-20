import os
import pytest

# Ensure we use the production-style DB URL when running tests
os.environ.setdefault("APP_ENV", "PRODUCTION")

from app import app

@pytest.fixture
def web_client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

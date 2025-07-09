import pytest
from app import app

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_home_page(client):
    """Test the home page returns 200 OK"""
    response = client.get('/')
    assert response.status_code == 200
    assert b"Hello" in response.data  # Adjust depending on your actual response

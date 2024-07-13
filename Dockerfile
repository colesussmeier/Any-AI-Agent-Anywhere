FROM quay.io/jupyter/base-notebook

COPY requirements.txt .

RUN pip install --upgrade pip setuptools

RUN pip install --no-cache-dir -r requirements.txt

COPY . .
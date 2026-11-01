FROM spidybhai/zzz:v3

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN pip install uv

RUN uv venv
COPY requirements.txt .
RUN uv pip install --no-cache-dir -r requirements.txt

COPY . .

# Convert Windows line endings and make executable
RUN sed -i 's/\r$//' start.sh && chmod +x start.sh

CMD ["bash", "start.sh"]

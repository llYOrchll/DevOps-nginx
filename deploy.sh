echo "Iniciando deploy"
sudo systemctl stop nginx
pkill ngrok

sudo git pull origin main
sudo systemctl start nginx
ngrok http 80 > /dev/null &
sleep 7
ngrok_url=$(curl -s http://localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')
echo "La pagina esta lista en la URL: $ngrok_url"
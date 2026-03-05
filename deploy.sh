readonly BACKEND_GITHUB_URL="https://github.com/sisv1der/media-conversion-service"
readonly FRONTEND_GITHUB_URL="https://github.com/sisv1der/media-conversion-service-frontend-react"

clone_or_pull() {
	local url="$1"
	local dir="$2"
	
	if [ -d "./$dir" ]; then
		git -C "$dir" pull
	else
		git clone "$url" "$dir"
	fi
}

shutdown_app() {
	docker compose down
}

compose_up() {
	docker compose up -d --build
}

clone_or_pull "$BACKEND_GITHUB_URL" "backend"
clone_or_pull "$FRONTEND_GITHUB_URL" "frontend"

sudo chmod +x ./backend/mvnw

shutdown_app

compose_up


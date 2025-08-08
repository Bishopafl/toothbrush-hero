# Container name variable
CONTAINER = toothbrush_app

# Step 1: Start Docker containers
up:
	docker-compose up -d --build

# Step 2: Bootstrap Laravel environment (assumes Laravel now exists)
install:
	docker exec -it $(CONTAINER) composer install
	docker exec -it $(CONTAINER) cp .env.example .env || true
	docker exec -it $(CONTAINER) php artisan key:generate
	docker exec -it $(CONTAINER) php artisan migrate --seed

# Step 3: Create an admin user
create-admin:
	docker exec -it $(CONTAINER) php artisan tinker --execute="\\App\\Models\\User::create(['first_name'=>'Adam', 'last_name'=>'Admin','email'=>'admin@hero.com','password'=>bcrypt('password')])"

# Optional: Full setup (without create-laravel)
fresh-start:
	make up && make install && make create-admin

# Developer Shortcuts
# Example: make model NAME=BrushingSession
model:
	docker exec -it $(CONTAINER) php artisan make:model $(NAME) -m

# Example: make controller NAME=BrushingSessionController
controller:
	docker exec -it $(CONTAINER) php artisan make:controller $(NAME)

# Example: make request NAME=StoreBrushingSessionRequest
request:
	docker exec -it $(CONTAINER) php artisan make:request $(NAME)

# SSH into the container
ssh:
	docker exec -it $(CONTAINER) bash

# Stop and remove containers
down:
	docker-compose down

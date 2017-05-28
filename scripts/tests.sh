#!/bin/bash

sudo chown -R 82:82 .

docker-compose up -d

docker-compose run --user 82 php vendor/bin/phpunit -c core core/tests/Drupal/Tests/Core/Password/PasswordHashingTest.php
docker-compose run --user 82 php vendor/bin/phpunit -c core core/tests/Drupal/KernelTests/Component/Utility/SafeMarkupKernelTest.php
docker-compose run --user 82 php vendor/bin/phpunit -c core core/tests/Drupal/FunctionalTests/Breadcrumb/Breadcrumb404Test.php

sudo chown -R marine17:marine17 .

docker-compose down --remove-orphans

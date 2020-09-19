//
// Created by Dmitrii Voronin on 19.09.2020.
//

#include "catch.hpp"
#include "CCoffee.h"
#include "CChocolate.h"
#include "Cream.h"
#include "CLiquor.h"

TEST_CASE("Test cream")
{
    auto latte = std::make_unique<CLatte>(CoffeePortionType::Double);
    auto latteWithCream = std::make_unique<CCream>(std::move(latte));
    auto latteWithCreamAndChocolate = std::make_unique<CChocolate>(std::move(latteWithCream), 2);

    CHECK(latteWithCreamAndChocolate->GetCost() == 130 + 20 + 25);
    CHECK(latteWithCreamAndChocolate->GetDescription() == "Double Latte, Cream, Chocolate 2 slices");
}

TEST_CASE("Test chocolate")
{
    auto latte = std::make_unique<CLatte>(CoffeePortionType::Standart);
    auto latteWitnChocolate = std::make_unique<CChocolate>(std::move(latte), 22);

    CHECK(latteWitnChocolate->GetCost() == 90 + 5 * 10);
    CHECK(latteWitnChocolate->GetDescription() == "Latte Standart, Chocolate 5 slices");
}
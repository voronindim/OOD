//
// Created by Dmitrii Voronin on 19.09.2020.
//

#include "catch.hpp"
#include "CCoffee.h"
#include "CTea.h"
#include "CMilkshake.h"

TEST_CASE("Test latte")
{
    CLatte standartLatte(CoffeePortionType::Standart);
    CLatte doubleLatte(CoffeePortionType::Double);

    CHECK(standartLatte.GetCost() == 90);
    CHECK(standartLatte.GetDescription() == "Latte Standart");

    CHECK(doubleLatte.GetCost() == 130);
    CHECK(doubleLatte.GetDescription() == "Double Latte");
}

TEST_CASE("Test cappuccino")
{
    CCappuccino standart(CoffeePortionType::Standart);
    CCappuccino doubleCappuccino(CoffeePortionType::Double);

    CHECK(standart.GetCost() == 80);
    CHECK(standart.GetDescription() == "Cappuccino Standart");

    CHECK(doubleCappuccino.GetCost() == 120);
    CHECK(doubleCappuccino.GetDescription() == "Double Cappuccino");
}

TEST_CASE("Test Tea")
{
    CBlackTea blackTea;
    CRedTea redTea;
    CWhiteTea whiteTea;
    CGreenTea greenTea;

    CHECK(blackTea.GetCost() == 30);

    CHECK(blackTea.GetDescription() == "Black Tea");
    CHECK(redTea.GetDescription() == "Red Tea");
    CHECK(whiteTea.GetDescription() == "White Tea");
    CHECK(greenTea.GetDescription() == "Green Tea");
}

TEST_CASE("Test Milkshake")
{
    CMilkshake smallMilkshake(MilkshakePortionType::Small);
    CMilkshake standartMilkshake(MilkshakePortionType::Standart);
    CMilkshake largeMilkshake(MilkshakePortionType::Large);

    CHECK(smallMilkshake.GetCost() == 50);
    CHECK(standartMilkshake.GetCost() == 60);
    CHECK(largeMilkshake.GetCost() == 80);

    CHECK(smallMilkshake.GetDescription() == "Small Milkshake");
    CHECK(standartMilkshake.GetDescription() == "Standart Milkshake");
    CHECK(largeMilkshake.GetDescription() == "Large Milkshake");
}
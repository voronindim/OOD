//
// Created by Dmitrii Voronin on 19.09.2020.
//
#pragma once
#include "Beverage.h"

enum MilkshakePortionType {
    Small,
    Standart,
    Large
};

class CMilkshake: public CBeverage
{
public:
    CMilkshake(MilkshakePortionType portionType)
        : m_portionType(portionType)
    {
        switch (portionType)
        {
            case Small:
                m_description = "Small Milkshake";
                break;
            case Standart:
                m_description = "Standart Milkshake";
                break;
            default:
                m_description = "Large Milkshake";
                break;
        }
    }

    [[nodiscard]] double GetCost() const override
    {
        switch (m_portionType)
        {
            case Small:
                return 50;
            case Standart:
                return 60;
            default:
                return 80;
        }
    }
protected:
    MilkshakePortionType m_portionType;
};


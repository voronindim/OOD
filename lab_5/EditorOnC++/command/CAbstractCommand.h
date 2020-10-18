//
// Created by Dmitrii Voronin on 18.10.2020.
//
#pragma once
#include "ICommand.h"

class CAbstractCommand : public ICommand
{
public:
    void Execute() final;
    void Unexecute() final;

protected:
    virtual void DoExecute() = 0;
    virtual void DoUnexecute() = 0;

    [[nodiscard]] bool IsExecuted() const;

private:
    bool m_executed = false;
};



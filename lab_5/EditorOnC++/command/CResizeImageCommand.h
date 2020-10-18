//
// Created by Dmitrii Voronin on 18.10.2020.
//

#pragma once
#include "../document/image/IImage.h"
#include "CAbstractCommand.h"

using namespace std;

class CResizeImageCommand : public CAbstractCommand
{
public:
    CResizeImageCommand(shared_ptr<IImage> image, int width, int height);

protected:
    void DoExecute() override;
    void DoUnexecute() override;

private:
    shared_ptr<IImage> m_image;

    int m_width;
    int m_newWidth;

    int m_height;
    int m_newHeight;
};

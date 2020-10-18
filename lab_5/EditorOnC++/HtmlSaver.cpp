//
// Created by Dmitrii Voronin on 18.10.2020.
//

#include "HtmlSaver.h"
#include <fstream>

string GetHtmlString(const string& str)
{
    string htmlStr;

    for (auto ch : str)
    {
        switch (ch)
        {
            case '\"':
                htmlStr += "&quot;";
                break;
            case '\'':
                htmlStr += "&apos;";
                break;
            case '<':
                htmlStr += "&lt;";
                break;
            case '>':
                htmlStr += "&gt;";
                break;
            case '&':
                htmlStr += "&amp;";
                break;
            default:
                htmlStr += ch;
                break;
        }
    }

    return htmlStr;
}

void SaveToHtmlFunction(const string& path, const string& title, const vector<CDocumentItem>& items)
{
    std::ofstream html(path);

    html << "<html>" << std::endl;
    html << "<head>" << std::endl;
    html << "<title>" << title << "</title>" << std::endl;
    html << "</head>" << std::endl;
    html << "<body>" << std::endl;

    for (size_t i = 0; i < items.size(); ++i)
    {
        auto item = items[i];

        if (auto image = item.GetImage())
        {
            auto src = image->GetPath();
            auto width = image->GetWidth();
            auto height = image->GetHeight();

            html << "<img src=" << src << " width=\"" << width << "\" height=\"" << height << "\" />" << std::endl;
        }
        else
        {
            auto paragraph = item.GetParagraph();
            std::string text = paragraph->GetText();
            html << "<p>" << text << "</p>" << std::endl;
        }
    }

    html << "</body>" << std::endl;
    html << "</html>" << std::endl;
}

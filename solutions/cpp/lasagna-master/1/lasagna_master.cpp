#include "lasagna_master.h"
#include <vector>
#include <string>
namespace lasagna_master
{

    int preparationTime(const std::vector<std::string> &layers, int min = 2)
    {
        return layers.size() * min;
    }
    int preparationTime(const std::vector<std::string> &layers)
    {
        return layers.size() * 2;
    }

    amount quantities(const std::vector<std::string> &layers)
    {
        auto ans = amount{0, 0.0};
        for (auto s : layers)
        {
            if (s == "noodles")
            {
                ans.noodles += 50;
            }
            else if (s == "sauce")
            {
                ans.sauce += 0.2;
            }
        }
        return ans;
    }

    void addSecretIngredient(std::vector<std::string> &myList, const std::vector<std::string> &friendsList)
    {
        myList.back() = friendsList.back();
    }

    std::vector<double> scaleRecipe(std::vector<double> quantities, int p)
    {
        std::vector<double> ans{};
        for (auto x : quantities)
        {
            ans.push_back(x / 2 * p);
        }
        return ans;
    }

    void addSecretIngredient(std::vector<std::string> &myList, std::string s)
    {
        myList.back() = s;
    }

} // namespace lasagna_master

#include "power_of_troy.h"
#include <memory>
#include <string>

namespace troy
{

    void give_new_artifact(human &h, std::string s)
    {
        h.possession = std::make_unique<artifact>(s);
    }
    void exchange_artifacts(std::unique_ptr<artifact> &a, std::unique_ptr<artifact> &b)
    {
        std::swap(a, b);
    }
    void manifest_power(human &h, std::string s)
    {
        h.own_power = std::make_shared<power>(s);
    }
    void use_power(human &h, human &i)
    {
        i.influenced_by = h.own_power;
    }
    int power_intensity(human &h)
    {
        return h.own_power.use_count();
    }
} // namespace troy

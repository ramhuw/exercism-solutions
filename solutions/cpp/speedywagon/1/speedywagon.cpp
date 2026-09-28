#include "speedywagon.h"

namespace speedywagon
{

    // Enter your code below:
    bool connection_check(pillar_men_sensor *p)
    {
        return p != NULL;
    }

    int activity_counter(pillar_men_sensor sensor_array[], int n)
    {
        auto ans{0};
        for (auto i = 0; i < n; i++)
        {
            ans += sensor_array->activity;
            sensor_array++;
        }
        return ans;
    }

    bool alarm_control(pillar_men_sensor *p)
    {
        if (p == nullptr)
        {
            return false;
        }
        else
        {
            return p->activity > 0;
        }
    }
    bool uv_alarm(pillar_men_sensor *p)
    {
        if (p == NULL)
        {
            return false;
        }
        return uv_light_heuristic(&p->data) > p->activity;
    }

    // Please don't change the interface of the uv_light_heuristic function
    int uv_light_heuristic(std::vector<int> *data_array)
    {
        double avg{};
        for (auto element : *data_array)
        {
            avg += element;
        }
        avg /= data_array->size();
        int uv_index{};
        for (auto element : *data_array)
        {
            if (element > avg)
                ++uv_index;
        }
        return uv_index;
    }

} // namespace speedywagon

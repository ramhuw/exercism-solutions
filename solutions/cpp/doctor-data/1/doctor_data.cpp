#include <string>
namespace star_map
{
    enum class System
    {
        BetaHydri,
        Sol,
        EpsilonEridani,
        AlphaCentauri,
        DeltaEridani,
        Omicron2Eridani
    };
}
namespace heaven
{
    class Vessel
    {
    public:
        star_map::System current_system;
        int generation;
        int busters;
        std::string name;
        Vessel(std::string na, int n)
        {
            name = na;
            generation = n;
            busters = 0;
            current_system = star_map::System::Sol;
        }
        Vessel(std::string na, int n, star_map::System s)
        {
            name = na;
            generation = n;
            busters = 0;
            current_system = s;
        }
        Vessel(std::string na, int n, star_map::System s, int b)
        {
            name = na;
            generation = n;
            busters = b;
            current_system = s;
        }
        Vessel replicate(std::string name)
        {
            return Vessel{name, generation + 1, current_system, busters};
        }
        void make_buster()
        {
            busters += 1;
        }
        bool shoot_buster()
        {
            if (busters > 0)
            {
                busters -= 1;
                return true;
            }
            return false;
        }
    };
    std::string get_older_bob(Vessel a, Vessel b)
    {
        return a.generation <= b.generation ? a.name : b.name;
    }
    bool in_the_same_system(Vessel a, Vessel b)
    {
        return a.current_system == b.current_system;
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MasterFloorInfoSys
{
    public static class ProductionCalculator
    {
        public static int CalculateMaterial(
            int productTypeCoefficient,
            int materialDefectRate,
            int productQuantity,
            double parameter1,
            double parameter2)
        {

            if (productTypeCoefficient <= 0 || productQuantity <= 0 ||
                parameter1 <= 0 || parameter2 <= 0 || materialDefectRate <= 0)
            {
                return -1;
            }

            double materialPerUnit = parameter1 * parameter2 * productQuantity;
            double totalMaterial = materialPerUnit * productQuantity;
            double defectMultiplier = 1 + (materialDefectRate / 100);

            int result = (int)Math.Ceiling(totalMaterial * defectMultiplier);
            return result;
        }
    }

}

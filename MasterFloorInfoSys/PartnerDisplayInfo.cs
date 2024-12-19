using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MasterFloorInfoSys
{
    public class PartnerDisplayInfo
    {
        public int ID { get; set; }             // Уникальный идентификатор партнера
        public string Name { get; set; }        // Название компании
        public string CEO { get; set; }         // Имя, отчество и фамилия директора
        public string PhoneNumber { get; set; } // Телефонный номер партнера
        public int Rating { get; set; }         // Рейтинг партнера
        public string PartnerType { get; set; } // Тип партнера (например, "Клиент" или "Поставщик")
        public string Discount { get; set; }    // Скидка в процентах (например, "10%")
    }

}

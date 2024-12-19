using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MasterFloorInfoSys.ViewModels
{
    public class PartnerViewModel
    {
        public string CEOFullName { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string Address { get; set; }
        public string TIN { get; set; }
        public int? Rating { get; set; }
        public int? PartnerTypeID { get; set; }

        public PartnerViewModel(Partner partner)
        {
            CEOFullName = $"{partner.CEOFirstName} {partner.CEOMiddleName} {partner.CEOLastName}".Trim();
            Name = partner.Name;
            Email = partner.Email;
            PhoneNumber = partner.PhoneNumber;
            Address = partner.Address;
            TIN = partner.TIN;
            Rating = partner.Rating;
            PartnerTypeID = partner.PartnerType1?.ID;
        }
        
    }

}

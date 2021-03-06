﻿using System.Collections.Generic;
using Template.Models.ServiceModels.Admin;

namespace Template.Models.ViewModels.Admin
{
    public class CreateUserViewModel : ViewModel<CreateUserRequest>
    {
        #region Constructors

        public CreateUserViewModel(CreateUserRequest request) : base(request) { }

        public CreateUserViewModel() : this(new CreateUserRequest()) { }

        #endregion

        public List<SelectListItem> RolesLookup { get; set; }
    }
}

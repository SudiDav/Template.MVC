﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Template.Models.ServiceModels.Admin
{
    public class UpdateConfigurationItemRequest : IValidatableObject
    {
        public int Id { get; set; }

        [Required]
        public string Description { get; set; }

        [Display(Name = "Boolean value")]
        public bool? BooleanValue { get; set; }

        [DataType(DataType.DateTime)]
        [Display(Name = "Date and time value")]
        public DateTime? DateTimeValue { get; set; }

        [Display(Name = "Decimal value")]
        public decimal? DecimalValue { get; set; }

        [Display(Name = "Integer value")]
        public int? IntValue { get; set; }

        [DataType(DataType.Currency)]
        [Display(Name = "Money value")]
        public decimal? MoneyValue { get; set; }

        [Display(Name = "String value")]
        public string StringValue { get; set; }

        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            int populatedFieldCount = 0;

            if (BooleanValue != null)
            {
                populatedFieldCount++;
            }

            if (DateTimeValue != null)
            {
                populatedFieldCount++;
            }

            if (DecimalValue != null)
            {
                populatedFieldCount++;
            }

            if (IntValue != null)
            {
                populatedFieldCount++;
            }

            if (MoneyValue != null)
            {
                populatedFieldCount++;
            }

            if (StringValue != null)
            {
                populatedFieldCount++;
            }

            if (populatedFieldCount == 0)
            {
                yield return new ValidationResult("Please configure at least 1 value");
            }

            if (populatedFieldCount > 1)
            {
                yield return new ValidationResult("You may only have 1 configured value");
            }
        }
    }
}

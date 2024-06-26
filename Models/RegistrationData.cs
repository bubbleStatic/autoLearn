﻿using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.BlazorIdentity.Pages;
using System.ComponentModel.DataAnnotations;

namespace diplom.Models {
    public class RegistrationData {
        [Required(ErrorMessage = "Поле логина не может быть пустым")]
        [MaxLength(25, ErrorMessage = "Логин не может быть больше 25 символов")]
        public string login { get; set; }

        [Required(ErrorMessage = "Поле пароля не может быть пустым")]
        [MinLength(8, ErrorMessage = "Пароль должен быть больше 8 символов")]
        [MaxLength(25, ErrorMessage = "Пароль не может быть больше 25 символов")]
        public string password { get; set; }

        //[RegularExpression(@"^([a-z]|[A-Z]|[0-9])+\@[a-z]+\.[a-z]+$", ErrorMessage = "Недействительный адрес почты")]
        [Required(ErrorMessage = "Поле почты не может быть пустым")]
        [EmailAddress(ErrorMessage = "Недействительный адрес почты")]
        [MaxLength(255, ErrorMessage = "Почта не может быть больше 255 символов")]
        public string email { get; set; }
        [Required(ErrorMessage = "Поле вопроса не может быть пустым")]
        public string secretQuestion { get; set; }
        [Required(ErrorMessage = "Поле ответа на вопрос не может быть пустым")]
        public string answerToTheSecretQuestion { get; set; }
    }
}

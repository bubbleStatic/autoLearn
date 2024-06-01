﻿using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.BlazorIdentity.Pages;
using System.ComponentModel.DataAnnotations;

namespace diplom.Models {
    public class RegistrationData {
        [Required(ErrorMessage = "Поле логина не может быть пустым")]
        public string login;

        [Required(ErrorMessage = "Поле пароля не может быть пустым")]
        [MinLength(8, ErrorMessage = "Пароль должен быть больше 8 символов")]
        public string password;

        [Required(ErrorMessage = "Поле почты не может быть пустым")]
        [RegularExpression(@"^([a-z]|[A-Z]|[0-9])+\@[a-z]+\.[a-z]+$", ErrorMessage = "Недействительный адрес почты")]
        public string email;
        [Required(ErrorMessage = "Поле вопроса не может быть пустым")]
        public string secretQuestion;
        [Required(ErrorMessage = "Поле ответа на вопрос не может быть пустым")]
        public string answerToTheSecretQuestion;
    }
}
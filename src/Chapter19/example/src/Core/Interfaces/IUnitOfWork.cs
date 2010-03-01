using System;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace Core
{
   public interface IUnitOfWork : IDisposable
   {
      void Begin();
      void Commit();
      void RollBack();
   }

   public interface IRulesEngine
   {
      ICanSucceed Process(object message);
   }

   public interface ICanSucceed
   {
      bool Successful { get; }
      IEnumerable<ErrorMessage> Errors { get; }
      T Result<T>();
   }

   public class ErrorMessage
   {
      public LambdaExpression InvalidProperty { get; set; }
      public string Message { get; set; }
   }
}
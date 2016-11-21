using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BoardGameHelper.DAL
{
    public interface IDeck : IDisposable
    {
        Models.TestCard DrawCard();
        void ResetDeck();
    }
}

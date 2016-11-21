using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BoardGameHelper.Models;

namespace BoardGameHelper.DAL
{
    public class TestCardDeck : IDeck
    {
        private TestCardContext context;

        public TestCardDeck (TestCardContext context)
        {
            this.context = context;
        }

        private bool disposed = false;
        public virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    context.Dispose();
                }
            }
            this.disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        TestCard IDeck.DrawCard()
        {
            List<TestCard> availableCards = context.TestCards.Where(tc => !tc.IsDrawn).ToList();
            if (availableCards.Count == 0)
                return null;

            Random r = new Random();
            int drawnCardIndex = r.Next(availableCards.Count);
            TestCard drawnCard = availableCards[drawnCardIndex];
            drawnCard.IsDrawn = true;
            context.SaveChanges();
            return drawnCard;
        }

        void IDeck.ResetDeck()
        {
            List<TestCard> allCards = context.TestCards.ToList();
            foreach (TestCard c in allCards)
            {
                c.IsDrawn = false;
            }

            context.SaveChanges();
        }
    }
}
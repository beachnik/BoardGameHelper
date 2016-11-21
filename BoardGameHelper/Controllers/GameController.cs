using BoardGameHelper.DAL;
using BoardGameHelper.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BoardGameHelper.Controllers
{
    public class GameController : Controller
    {
        // GET: Game
        IDeck testDeck;

        public GameController()
        {
            testDeck = new TestCardDeck(new TestCardContext());
        }

        public ActionResult Index()
        {
            
            return View();
        }
        
        [HttpPost]
        public ActionResult DrawCard()
        {
            TestCard card = testDeck.DrawCard();
            if (card != null)
            {
                return Content("The card you drew was " + card.CardName);
            }

            return Content("There were no cards remaining in the deck");
        }

        [HttpPost]
        public void ResetDeck()
        {
            testDeck.ResetDeck();
        }
        
    }
}
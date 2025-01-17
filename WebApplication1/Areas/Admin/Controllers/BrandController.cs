﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models.Data;
namespace WebApplication1.Areas.Admin.Controllers
{
    public class BrandController : Controller
    {
        DBLAPTOPEntities db = new DBLAPTOPEntities();
        // GET: Admin/Brand
        public ActionResult listBrands()
        {
            if (Session["userID"] == null)
            {
                return RedirectToAction("Login", "Account");
            }
            return View(db.Brands.ToList());
        }

        [HttpGet]
        public ActionResult insertBrand()
        {
            if (Session["userID"] == null)
            {
                return RedirectToAction("Login", "Account");
            }
            return View();
        }

        [HttpPost]
        public ActionResult insertBrand(Brand brand)
        {
            db.Brands.Add(brand);
            db.SaveChanges();
            return RedirectToAction("listBrands");
        }

        [HttpGet]
        public ActionResult editBrand(int? id)
        {
            if (Session["userID"] == null || id == null)
            {
                return RedirectToAction("Login", "Account");
            }
            return View(db.Brands.Find(id));
        }

        [HttpPost]
        public ActionResult editBrand(Brand brand)
        {
            db.Entry(brand).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("listBrands");
        }

        public ActionResult deleteBrand(int? id)
        {
            if (Session["userID"] == null || id == null)
            {
                return RedirectToAction("Login", "Account");
            }
            try
            {
                var brand = db.Brands.Find(id);
                db.Brands.Remove(brand);
                db.SaveChanges();
                return RedirectToAction("listBrands");
            }
            catch (Exception)
            {
                ViewBag.Alert = "<div class='alert alert-danger' role='alert'>Không thể xóa thương hiệu này</div>";
                return View("listCategories", db.Categories.ToList());
            }
        }
    }
}
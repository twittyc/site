
import { useEffect } from "react";
import Header from "@/components/Header";
import HeroSection from "@/components/HeroSection";
import ExperienceSection from "@/components/ExperienceSection";
import SkillsSection from "@/components/SkillsSection";
import ProjectsSection from "@/components/ProjectsSection";
import ContactSection from "@/components/ContactSection";
import Footer from "@/components/Footer";
import ScrollToTop from "@/components/ScrollToTop";
import { resumeData } from "@/data/resumeData";

const Index = () => {
  // Handle parallax scrolling effect
  useEffect(() => {
    const handleScroll = () => {
      const parallaxElements = document.querySelectorAll(".parallax-bg");
      const scrollPosition = window.pageYOffset;
      
      parallaxElements.forEach((element) => {
        const elementHtml = element as HTMLElement;
        elementHtml.style.transform = `translateY(${scrollPosition * 0.4}px)`;
      });
    };
    
    window.addEventListener("scroll", handleScroll);
    return () => {
      window.removeEventListener("scroll", handleScroll);
    };
  }, []);

  return (
    <div className="min-h-screen bg-background">
      <Banner /> {}
      <Header data={resumeData} />
      <HeroSection data={resumeData} />
      <ExperienceSection data={resumeData} />
      <SkillsSection data={resumeData} />
      <ProjectsSection data={resumeData} />
      <ContactSection data={resumeData} />
      <Footer data={resumeData} />
      <ScrollToTop />
    </div>
  );
};

export default Index;

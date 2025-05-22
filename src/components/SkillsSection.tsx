import { ResumeData } from "../data/resumeData";
import { useEffect, useRef } from "react";

interface SkillsSectionProps {
  data: ResumeData;
}

const SkillsSection = ({ data }: SkillsSectionProps) => {
  const sectionRef = useRef<HTMLDivElement>(null);
  
  useEffect(() => {
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            entry.target.classList.add("active");
          }
        });
      },
      { threshold: 0.3 }
    );
    
    if (sectionRef.current) {
      observer.observe(sectionRef.current);
    }
    
    return () => {
      if (sectionRef.current) {
        observer.unobserve(sectionRef.current);
      }
    };
  }, []);

  // Define primary categories and their associated keywords
  const categoryKeywords = {
    "DevOps & Infrastructure": [
      "Kubernetes", "Terraform", "CI/CD", "Continuous Integration", 
      "Continuous Delivery", "DevOps", "Cloud", "Nix", "Dhall"
    ],
    "Programming Languages": [
      "Rust", "Go", "Python", "TypeScript", "JavaScript", "Java", 
      "C#", "C++", "Ruby", "PHP"
    ],
    "Databases & Tools": [
      "PostgreSQL", "Git", "Docker", "AWS", "Azure", "GCP"
    ]
  };

  // Group buzzwords by category
  const skillCategories = Object.entries(categoryKeywords).reduce((acc, [category, keywords]) => {
    acc[category] = data.buzzwords.filter(skill => 
      keywords.some(keyword => skill.name.toLowerCase().includes(keyword.toLowerCase()))
    );
    return acc;
  }, {} as Record<string, typeof data.buzzwords>);

  // Find skills that don't fit into any category
  const categorizedSkills = new Set(
    Object.values(skillCategories).flatMap(skills => 
      skills.map(skill => skill.name.toLowerCase())
    )
  );

  const otherSkills = data.buzzwords.filter(skill => 
    !categorizedSkills.has(skill.name.toLowerCase())
  );

  // Add other skills to a catch-all category if there are any
  if (otherSkills.length > 0) {
    skillCategories["Other Skills"] = otherSkills;
  }

  return (
    <section id="skills" className="py-20 bg-gradient-to-b from-white to-blue-50">
      <div className="container mx-auto px-4">
        <h2 className="apple-heading text-4xl md:text-5xl text-center mb-16">Skills & Expertise</h2>
        
        <div 
          ref={sectionRef}
          className="scroll-section"
        >
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            {Object.entries(skillCategories).map(([category, skills], index) => (
              <div 
                key={index}
                className="bg-white rounded-xl shadow-lg p-8 hover:shadow-xl transition-shadow"
              >
                <h3 className="apple-heading text-xl mb-6">{category}</h3>
                <div className="space-y-4">
                  {skills.map((skill, i) => (
                    <div key={i} className="space-y-2">
                      <div className="flex justify-between items-center">
                        <span className="font-medium">{skill.name}</span>
                        <span className="text-sm text-gray-500">{skill.rating}%</span>
                      </div>
                      <div className="h-2 w-full bg-gray-200 rounded-full overflow-hidden">
                        <div 
                          className="h-full bg-primary rounded-full transition-all duration-1000" 
                          style={{ width: `${skill.rating}%` }}
                        ></div>
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
};

export default SkillsSection;

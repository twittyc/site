// src/data/resumeData.ts
// Hydrates the Dhall-generated resume JSON payload and exports it with strong typings

import resumeJson from './resume.json';

// --- TypeScript Interfaces ---

interface Buzzword {
  name: string;
  rating: number;
  roleTags?: string[];
}

interface Location {
  city: string;
  country: string;
  remote: boolean;
  stateOrProvince: string;
}

interface Company {
  defunct: boolean;
  location: Location;
  name: string;
  url?: string;
  image?: string;  // Full URL to company logo/image
}

interface Job {
  company: Company;
  contract: boolean;
  endDate?: string | null;
  hideFromResume: boolean;
  highlights: string[];
  leaveReason?: string | null;
  locations: Location[];
  roleTags?: string[];
  startDate: string;
  summary: string;
  title: string;
}

interface NotableContribution {
  description: string;
  title: string;
  url: string;
}

interface ContactSocial {
  github?: string | null;
  linkedin?: string | null;
  twitter?: string | null;
}

interface ContactInfo {
  email: string;
  phone: string;
  location: string;
  social: ContactSocial;
}

export interface ResumeData {
  buzzwords: Buzzword[];
  jobs: Job[];
  name: string;
  notableContributions: NotableContribution[];
  headshot?: string;
  summary: string;
  title: string;
  location?: Location;
  contact: ContactInfo;
}

// Transform the JSON data to match our interface
const transformData = (data: any): ResumeData => {
  const jobs: Job[] = (data.jobs || []).map((job: any) => ({
    ...job,
    highlights: Array.isArray(job.highlights) ? job.highlights : [],
    summary: job.summary || ""
  }));

  return {
    buzzwords: data.buzzwords || [],
    jobs,
    name: data.name,
    notableContributions: data.notableContributions || [],
    headshot: data.headshot,
    summary: data.summary,
    title: data.title,
    location: data.location,
    contact: {
      email: data.contact?.email || "cory@twitty.codes",
      phone: data.contact?.phone || "(555) 555-5555",
      location: data.contact?.location || "Denver, CO",
      social: {
        github: data.contact?.social?.github,
        linkedin: data.contact?.social?.linkedin,
        twitter: data.contact?.social?.twitter
      }
    }
  };
};

export const resumeData: ResumeData = transformData(resumeJson);

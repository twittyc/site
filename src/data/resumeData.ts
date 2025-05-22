// src/data/resumeData.ts
// Hydrates the Dhall-generated resume JSON payload and exports it with strong typings

import resumeJson from './resume.json';

// --- TypeScript Interfaces ---

export interface Location {
  city: string;
  stateOrProvince: string;
  country: string;
  remote: boolean;
}

export interface Company {
  name: string;
  defunct: boolean;
  url?: string;
  location: Location;
}

export interface JobHistoryEntry {
  company: Company;
  contract: boolean;
  daysBetween?: number;
  daysWorked?: number;
  endDate?: string;
  hideFromResume: boolean;
  highlights: string[];
  leaveReason?: string;
  locations: Location[];
  startDate: string;
  summary: string;
  title: string;
}

export interface ResumeData {
  headshot?: string;
  jobHistory: JobHistoryEntry[];
  name: string;
  summary: string;
  title?: string;
}

// Cast the imported JSON to our ResumeData type
export const resumeData: ResumeData = resumeJson as ResumeData;
import { Request, Response } from "express";
import { prisma } from "../index";

export const getAllTimeBlocks = async (req: Request, res: Response) => {
  const timeblocks = await prisma.timeblock.findMany();

  res.status(200).json({
    status: "success",
    data: timeblocks,
  });
};

export const createTimeblock = async (req: Request, res: Response) => {
  const { name, type, mode, s, duration, project, reminder } = req.body;
  
  const stime = new Date(s);
  const etime = new Date(stime.getTime() + (duration.h * 60 * 60 * 1000) + (duration.m * 60 * 1000));

  console.log({ name, type, mode, stime, duration, etime, project, reminder });
  

  const newTimeblock = await prisma.timeblock.create({
    data: {
      name: name,
      type: type,
      mode: mode,
      s: stime,
      duration: duration,
      e: etime,
      project: project,
      reminder: reminder,
      status: false,
    },
  });

  res.status(201).json({
    status: "success",
    data: newTimeblock,
  });
};

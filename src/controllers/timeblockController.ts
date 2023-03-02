import { Request, Response } from "express";
import { prisma } from "../index";

export const getAllTimeBlocks = async (req: Request, res: Response) => {
  const timeblocks = await prisma.timeblock.findMany();

  res.status(200).json({
    status: "success",
    timeblocks: timeblocks,
  });
};

export const createTimeblock = async (req: Request, res: Response) => {
  const { name, type, mode, s, duration, project, reminder } = req.body;

  const stime = new Date(s);
  const etime = new Date(
    stime.getTime() + duration.h * 60 * 60 * 1000 + duration.m * 60 * 1000
  );

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
    newTimeblock: newTimeblock,
  });
};

export const getTimeblockById = async (req: Request, res: Response) => {
  const { id } = req.params;

  const timeblock = await prisma.timeblock.findFirst({
    where: {
      id: parseInt(id, 10),
    },
  });

  res.status(200).json({
    status: "success",
    timeblock: timeblock,
  });
};

export const updateTimeblockById = async (req: Request, res: Response) => {
  const { id } = req.params;
  console.log(id);

  const { name, type, mode, s, duration, project, reminder } = req.body;

  const stime = new Date(s);
  const etime = new Date(
    stime.getTime() + duration.h * 60 * 60 * 1000 + duration.m * 60 * 1000
  );

  const updatedTimeblock = await prisma.timeblock.update({
    where: {
      id: parseInt(id, 10),
    },
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

  res.status(200).json({
    status: "success",
    updatedTimeblock: updatedTimeblock,
  });
};

export const deleteTimeblockById = async (req: Request, res: Response) => {
  const { id } = req.params;

  const deletedTimeblock = await prisma.timeblock.delete({
    where: {
      id: parseInt(id, 10),
    },
  });

  res.status(204).json({
    status: "success",
    deletedTimeblock: deletedTimeblock,
  });
};

export const getTimeBlocksByDate = async (req: Request, res: Response) => {
  const { date } = req.params;

  const selectedDate = new Date(JSON.parse(date));

  selectedDate.setHours(0);
  selectedDate.setMinutes(0);
  selectedDate.setSeconds(0);
  const selectedDateTimestamp = selectedDate.getTime();
  const nextDateTimestamp = selectedDateTimestamp + 24 * 60 * 60 * 1000;

  const nextDate = new Date(nextDateTimestamp);

  const timeblocksForDate = await prisma.timeblock.findMany({
    where: {
      s: {
        lt: nextDate,
        gt: selectedDate,
      },
    },
  });

  res.status(200).json({
    status: "success",
    timeblocks: timeblocksForDate,
  });
};

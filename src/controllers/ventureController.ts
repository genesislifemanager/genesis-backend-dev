import { Request, Response } from "express";
import { prisma } from "../index";
import dayjs from "dayjs";

export const getAllVentures = async (req: Request, res: Response) => {
  const { user } = req.params;

  const ventures = await prisma.venture.findMany({
    where: {
      OR: [{ id: -1 }, { uid: user }],
    },
    include: {
      projects: {
        select: {
          id: true,
          name: true,
        },
      },
    },
  });

  res.status(200).json({
    status: "success",
    ventures: ventures,
  });
};

export const createVenture = async (req: Request, res: Response) => {
  const { user } = req.params;
  const { id, name } = req.body;

  if (id) {
    const newVenture = await prisma.venture.create({
      data: {
        id:id,
        uid: user,
        name,
      },
    });

    res.status(201).json({
      status: "success",
      newVenture: newVenture,
    });
  } else {
    const newVenture = await prisma.venture.create({
      data: {
        uid: user,
        name,
      },
    });

    res.status(201).json({
      status: "success",
      newVenture: newVenture,
    });
  }
};

export const getVentureById = async (req: Request, res: Response) => {
  const { user, id } = req.params;

  const venture = await prisma.venture.findFirst({
    where: {
      uid: user,
      id: parseInt(id, 10),
    },
    include: {
      projects: {
        select: {
          id: true,
          name: true,
        },
      },
    },
  });

  res.status(200).json({
    status: "success",
    venture: venture,
  });
};

export const updateVentureById = async (req: Request, res: Response) => {
  const { user, id } = req.params;
  const { name } = req.body;

  const updatedVenture = await prisma.venture.updateMany({
    where: {
      AND: [{ uid: user }, { id: parseInt(id, 10) }],
    },
    data: {
      name,
    },
  });

  res.status(200).json({
    status: "success",
    updatedVenture: updatedVenture,
  });
};

export const deleteVentureById = async (req: Request, res: Response) => {
  const { user, id } = req.params;

  const projectsOfVenture = await prisma.project.updateMany({
    where: {
      AND: [{ uid: user }, { ventureId: parseInt(id, 10) }],
    },
    data: {
      ventureId: -1,
    },
  });

  const deletedVenture = await prisma.venture.deleteMany({
    where: {
      AND: [{ uid: user }, { id: parseInt(id, 10) }],
    },
  });

  res.status(204).json({
    status: "success",
    deletedVenture: deletedVenture,
  });
};
